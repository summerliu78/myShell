# -*- coding: UTF-8 -*-
# Author:LG
import urllib2
import json


class ZabbixAuth(object):
    ZABBIX_URL = 'http://zabbix.adrd.sohuno.com/api_jsonrpc.php'
    USERNAME = 'liuwei'
    PASSWORD = 'liuweiliuwei'

    def __init__(self, url=ZABBIX_URL, uname=USERNAME, pwd=PASSWORD):
        self.zurl = url
        self.zuname = uname
        self.zpwd = pwd
        self.auth = self.authenticate()

    def requestJson(self, values):
        data = json.dumps(values)
        req = urllib2.Request(self.zurl, data, {'Content-Type': 'application/json-rpc'})
        response = urllib2.urlopen(req, data)
        output = json.loads(response.read())
        try:
            message = output['result']
        except:
            # message = output['error']['data']
            message = output['error']
            print message
        # exit()
        return message

    def authenticate(self):
        values = {'jsonrpc': '2.0',
                  'method': 'user.login',
                  'params': {
                      'user': self.zuname,
                      'password': self.zpwd
                  },
                  'id': '0'
                  }
        auth = self.requestJson(values)
        return auth

    def getHost(self, hostname):

        """ get single hostid like ['1234'] search by hostname"""

        hostid_list = []
        values = {'jsonrpc': '2.0',
                  'method': 'host.get',
                  'params': {
                      'output': 'extend',
                      'filter': {
                          'host': hostname
                      },
                  },
                  'auth': self.auth,
                  'id': '2'
                  }
        output = self.requestJson(values)
        hostid_list.append(output[0]['hostid'])
        return hostid_list

    def gethostgroups(self):
        """ get zabbix all hostgroup name_list"""

        name_list = []
        values = {'jsonrpc': '2.0',
                  'method': 'hostgroup.get',
                  'params': {
                      'output': ['name']
                  },
                  'auth': self.auth,
                  'id': '2'
                  }
        output = self.requestJson(values)
        for i in output:
            name_list.append(i['name'])
        return name_list

    def gethostgroup(self,hostname):
        """ get zabbix hostgroup according to hostname"""
        groupnames = []
        groupids = []
        values = {'jsonrpc': '2.0',
                  'method': 'host.get',
                  'params': {
                      'output': 'groups',
                      'selectGroups': 'groups',
                      'filter': {
                          'host': hostname
                      }
                  },
                  'auth': self.auth,
                  'id': '2'
                  }
        output0 = self.requestJson(values)
        for x in output0[0]['groups']:
            groupids.append(x['groupid'])
        values1 = {'jsonrpc': '2.0',
                   'method': 'hostgroup.get',
                   'params': {
                        'output': ['name'],
                        'groupids': groupids
                  },
                  'auth': self.auth,
                  'id': '2'
                  }
        output = self.requestJson(values1)
        for y in output:
            groupnames.append(y['name'])
        return groupnames
