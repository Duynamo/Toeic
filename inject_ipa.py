import sys
import json
import eng_to_ipa as ipa
import re

dataPath = "Toeic-Web-App/data.js"
with open(dataPath, 'r', encoding='utf-8') as f:
    content = f.read()

prefix_match = re.search(r'const\s+TOEIC_DATA\s*=\s*', content)
if not prefix_match:
    print("Cannot find prefix `const TOEIC_DATA = `")
    sys.exit(1)

json_str = content[prefix_match.end():].strip()
if json_str.endswith(';'):
    json_str = json_str[:-1]

data = json.loads(json_str)

def strip_tags(text):
    return re.sub(r'<[^>]+>', '', text)

def convert_sentence_ipa(sentence):
    plain = strip_tags(sentence)
    ipa_str = ipa.convert(plain, keep_punct=True)
    # eng_to_ipa appends an asterisk to words it doesn't know. Let's remove them just to be clean.
    ipa_str = ipa_str.replace('*', '')
    return ipa_str

count = 0
for category, items in data.items():
    if isinstance(items, dict) and "value" in items:
        word_list = items["value"]
    else:
        word_list = items
        
    for word_obj in word_list:
        eng_sentence = None
        if "song_ngu" in word_obj and len(word_obj["song_ngu"]) > 0:
            eng_sentence = word_obj["song_ngu"][0]
        elif "vi_du_them" in word_obj and len(word_obj["vi_du_them"]) > 0:
            eng_sentence = word_obj["vi_du_them"][0].get("phrase", "")
            
        if eng_sentence and isinstance(eng_sentence, str):
            # Generate IPA and save it to the object
            word_obj["ipa_cau_vi_du"] = convert_sentence_ipa(eng_sentence)
            count += 1
            
# Save back to data.js
new_content = "const TOEIC_DATA = " + json.dumps(data, ensure_ascii=False, indent=2) + ";"
with open(dataPath, 'w', encoding='utf-8') as f:
    f.write(new_content)

print(f"Successfully injected IPA for {count} sentences.")
