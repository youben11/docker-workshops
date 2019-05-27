from django.shortcuts import render
from django.http import HttpResponse
import lxml.etree

DB = """
<users>
  <user>
    <username>admin</username>
    <password>S0M3th1NgT0o10nGtH4TC4n0tbegu35sed</password>
  </user>
  <user>
    <username>youben</username>
    <password>ioaqmdawjkl46</password>
  </user>
  <user>
    <username>philo213</username>
    <password>aze651wxcaz-#</password>
  </user>
  <user>
    <username>oussama</username>
    <password>az#qs65e8a9z750</password>
  </user>
</users>
"""

# Create your views here.
def login(request):
    info = ''
    username = request.GET.get('username', '')
    password = request.GET.get('pass', '')

    if not username or not password:
        return render(request, 'xpathinj/login.html', {'info':info})

    root = lxml.etree.fromstring(DB)
    req = '//user[./username = "%s" and ./password = "%s"]' % (username, password)

    try:
        user = root.xpath(req)
    except Exception as e:
        error = str(e)
        #make it easyier
        #error += ':' + req
        return render(request, 'xpathinj/login.html', {'info':error})

    if len(user):
        if user[0].xpath('./username')[0].text == 'admin':
            info = 'Congrats! here is your flag: ingehack{D0nt_tRu5t_u53r_1nPUt_4t_411}'
        else:
            info = 'Hello %s, I give the flag to the admin only' % username
    else:
        info = "Wrong Credentials"

    return render(request, 'xpathinj/login.html', {'info':info})
