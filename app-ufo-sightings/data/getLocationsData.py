import requests

nuforc_url = 'https://nuforc.org/ndx/?id=loc'
nuforc_ajax = 'https://nuforc.org/wp-admin/admin-ajax.php'
data = {'action':'tc_pro_csca_get_countries', 'nonce':'a16820bb4e'}

headers = {'Accept': 'application/json'}

s = requests.Session()
s.get(nuforc_url, headers=headers)
r = s.post(nuforc_ajax, data=data)

print(r.text)