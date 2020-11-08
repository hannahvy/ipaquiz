import xml.etree.ElementTree as ET
import csv

tree = ET.parse("socialanxiety_sample02.txt")
root = tree.getroot()

# open a file for writing

Pubmed_data = open('/tmp/parsed-data.csv', 'w')

# create the csv writer object

csvwriter = csv.writer(Pubmed_data)
pubmed_head = []

count = 0
for member in root.findall('PubmedArticle'):
	article = []
	address_list = []
	if count == 0:
		title = member.find('ArticleTitle').tag
		pubmed_head.append(title)

		abstract = member.find('Abstract').tag
		pubmed_head.append(abstract)

		csvwriter.writerow(pubmed_head)
		count = count + 1

	title = member.find('ArticleTitle').text
	article.append(title)

	abstract = member.find('Abstract').text
	article.append(abstract)

	article.append(address_list)
	csvwriter.writerow(article)
Resident_data.close()