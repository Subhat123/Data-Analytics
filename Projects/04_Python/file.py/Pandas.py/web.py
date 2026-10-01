import requests
url = "https://books.toscrape.com/"
from bs4 import BeautifulSoup

response=requests.get(url)
print(response.status_code)

soup = BeautifulSoup(
    response.text,
    "html.parser"
)

print(soup.title.text)



books = soup.find_all("h3")

for book