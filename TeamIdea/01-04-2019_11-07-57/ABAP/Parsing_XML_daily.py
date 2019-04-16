from urllib.request import urlopen
import xml.etree.ElementTree as ET
url = 'http://www.cbr.ru/scripts/XML_daily.asp'
page = urlopen(url)
with open("test.xml", "wb") as xml:
    xml.write(page.read())
root = ET.parse('test.xml').getroot()

name_value = []
for tags in root.findall('Valute'):
    # access all elements in node
    pair = []
    for element in tags:
        ele_name = element.tag
        ele_value = tags.find(element.tag).text
        pair.append([ele_name, ele_value])

    #         print(ele_name, ' : ', ele_value)
    #     print('-' * 30)
    name_value.append(pair)


def coma_dot(text):
    """
    Функция для замены запятой на точку в дробных значениях катировок
    """
    if ',' in text:
        text = text.replace(',', '.')
    return text


# max - min максимальное и минимальное значения валют
max = 0;
min = 1
for i in range(len(name_value)):

    # val - переобразованное значение валюты в цифровое значение
    val = float(coma_dot(name_value[i][4][1]))

    # nom - значение номинала валюты
    nom = float(coma_dot(name_value[i][2][1]))

    # nam - имя валюты
    nam = name_value[i][3][1]

    if val / nom > max:
        max = val / nom
        maxname = nam
    if val / nom < min:
        min = val / nom
        minname = nam

print('Самая дорогая валюта: ', max, ' руб. за один ', maxname)
print('Самая дешевая валюта: ', min, ' руб. за один ', minname)

# print((name_value[i][2], name_value[i][4], name_value[i][3]))