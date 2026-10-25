[System.IO.File]::Copy('C:\Users\hp\Downloads\Lab_A9_HuongDanThucHanh.docx', 'C:\dev\LTDD\A9_241A010541\temp_lab.docx', $true)
Add-Type -AssemblyName System.IO.Compression.FileSystem
$zip = [System.IO.Compression.ZipFile]::OpenRead('C:\dev\LTDD\A9_241A010541\temp_lab.docx')
foreach ($entry in $zip.Entries) {
    if ($entry.FullName -eq 'word/document.xml') {
        $sr = New-Object System.IO.StreamReader($entry.Open())
        $text = $sr.ReadToEnd()
        $sr.Close()
        [Console]::OutputEncoding = [System.Text.Encoding]::UTF8
        [xml]$xml = $text
        $ns = New-Object System.Xml.XmlNamespaceManager($xml.NameTable)
        $ns.AddNamespace('w', 'http://schemas.openxmlformats.org/wordprocessingml/2006/main')
        $paras = $xml.SelectNodes('//w:p', $ns)
        foreach ($p in $paras) {
            $tNodes = $p.SelectNodes('.//w:t', $ns)
            $line = ""
            foreach ($t in $tNodes) {
                $line += $t.InnerText
            }
            if ($line) {
                [Console]::WriteLine($line)
            }
        }
    }
}
$zip.Dispose()
