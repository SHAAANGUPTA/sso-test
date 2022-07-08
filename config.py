LOCAL = False


class Config:
    
    if not LOCAL:
        URL_PREFIX = ('https://salesdashboard-qatest.test.peak.ai/'
                      'app_direct/default')
    else:
        URL_PREFIX = ''
    
    PORT = 8050