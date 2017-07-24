import re,requests,time,urllib.request,sys,base64
from urllib.parse import unquote
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
	
TARGET = 600

driver = webdriver.Chrome()
driver.get("https://www.google.it/search?q=interior+design&tbm=isch&tbs=isz:ex,iszw:400,iszh:300")
elems = driver.find_elements_by_xpath('//*[@id="rg_s"]/div/a')
i = 1
while len(elems) < (TARGET):
	print("Ancora non vale la pena di iniziare (meno di "+str(len(elems))+" < 200), cerco altre immagini")
	driver.execute_script("window.scrollTo(0, document.body.scrollHeight);")
	time.sleep(1)
	elems = driver.find_elements_by_xpath('//*[@id="rg_s"]/div/a')
	
for elem in elems:
	encodedUrl = re.search(r'imgurl\=(.*?)\&', elem.get_attribute("href"))
	if encodedUrl is not None:
		decodedUrl = unquote(encodedUrl.group(1))
		try:
			path = "img/"+str(i)+str(decodedUrl[decodedUrl.rindex('.'):]).split('?', 1)[0]
			print("Nuova immagine salvata in '" + path + "'", end='\r')
			urllib.request.urlretrieve(decodedUrl, path)
			i = i + 1
		except:
			print("Errore di certificato ("+decodedUrl+")")
	if i > TARGET:
		break
print("Ho salvato " + str(i-1) + " immagini")
driver.close()
	