<head>
<meta charset="utf-8">
</head>

<style>
h1 {text-decoration: underline}
.red {color: #ff0000}
.center {text-align: center}
.slant {font-style: italic}
.blue {color: #0000ff}
</style>

# Naslov

In še nekaj teksta tukaj

<p class="red">red text</p>

### Red text title {#identifier .red}


<div class="center slant blue">
narediš markdown z head-om (utf-8) in style-om

convertaš v html z pandoc-om

convertaš v pdf z wkhtmltopdf-om
</div>

or pandoc -t html file.md -o file.pdf
works for pandoc 1.20 and up with wkhtmltopdf installed
