import zipfile
import xml.etree.ElementTree as ET

with zipfile.ZipFile(r'C:\Users\hp\Downloads\Lab_A9_HuongDanThucHanh.docx', 'r') as z:
    xml_content = z.read('word/document.xml')
    root = ET.fromstring(xml_content)
    for p in root.iter('{http://schemas.openxmlformats.org/wordprocessingml/2006/main}p'):
        para_texts = [t.text for t in p.iter('{http://schemas.openxmlformats.org/wordprocessingml/2006/main}t') if t.text]
        if para_texts:
            print(''.join(para_texts))
