# coding=utf-8
from baseAuth import ZabbixAuth
import time
import datetime
import json
import re
from collections import defaultdict


class AlertHandler(ZabbixAuth):
    def get_alerts(self, time_from, time_till):
        values = {'jsonrpc': '2.0',
                  'method': 'alert.get',
                  'params': {
                      # 'output': ['subject', 'eventid', 'status', 'alerttype', 'clock'],
                      'output': ['subject', 'eventid', 'clock'],
                      'time_from': time_from,
                      'time_till': time_till,
                      # 'filter': {'alerttype': '0'},  # 过滤发送类型为message而不是remote command
                      # 'filter': {'status': '1'}      # 发送成功的 #不在一个字典中类似或操作
                      'filter': {'alerttype': '0', 'status': '1', 'sendto': 'wb-guoliu@sohu-inc.com'}
                      # 'selectMediatypes': 'extend'
                  },
                  'auth': self.auth,
                  'id': '2'
                  }
        output = self.requestJson(values)

        # host_list = list(output[0]['hosts'])
        return output


if __name__ == '__main__':
    # print time.time()
    # print time.localtime()
    time_today = time.strftime('%Y-%m-%d %H:%M:%S', time.localtime())

    datetime_today = datetime.datetime.today().strftime('%Y-%m-%d %H:%M:%S')
    datetime_today_timestamp = int(time.mktime(datetime.datetime.today().timetuple()))

    datetime_yesterday = (datetime.datetime.today() - datetime.timedelta(days=1)).strftime('%Y-%m-%d %H:%M:%S')
    datetime_yesterday_timestamp = int(
        time.mktime((datetime.datetime.today() - datetime.timedelta(days=1)).timetuple()))

    # print datetime.datetime.today()
    # print time_today
    a = AlertHandler()
    res_json = a.get_alerts(datetime_yesterday_timestamp, datetime_today_timestamp)
    # print json.dumps(res_json, indent=4)
    print u'总邮件条数' + str(len(res_json))  # 发送给我的总邮件条数
    alert_dict = {}
    subject_clock_alert_dict = defaultdict(list)
    count_clock_alert_dict = defaultdict(int)
    count_clock_alert_dict_list = defaultdict(list)
    schema_clock_dict_list = defaultdict(list)
    s_ = {}
    problem_count = 0

    count_alert_dict = defaultdict(int)
    count_alert_dict_list = defaultdict(list)
    schema_dict_list = defaultdict(list)
    for x in res_json:
        if re.search('PROBLEM', x['subject']):
            problem_count += 1
            # print re.sub(r'(.*?)(adrd-[1-9]+.[1-9]+.[1-9]+.[1-9]+).*', r'\1\2', x['subject'])  # 完全一样的语句，确是不同的结果，^~^
            # print x['eventid'], re.sub(r'(.*?)(adrd-[1-9]+.[1-9]+.[1-9]+.[1-9]+).*', r'\1\2', x['subject'])
            # print re.sub(r'(.*?)(adrd-[0-9]+.[0-9]+.[0-9]+.[0-9]+).*', r'\1\2', x['subject'])
            # print x['eventid'], re.sub(r'(.*?)(adrd-[0-9]+.[0-9]+.[0-9]+.[0-9]+).*', r'\1\2', x['subject'])
            # repl_subject = re.sub(r'(.*?)(adrd-[0-9]+.[0-9]+.[0-9]+.[0-9]+).*', r'\1\2', x['subject'])
            # repl_subject = re.sub(r'(.*?)(adrd-[0-9]+.[0-9]+.[0-9]+.[0-9]+).*', r'\1\2', x['subject'])
            repl_subject = re.sub(r'(.*on )(adrd-[0-9]+.[0-9]+.[0-9]+.[0-9]+).*{.*', r'\1\2', x['subject'])
            alert_dict[x['eventid']] = repl_subject  # 去重 以eventid为准
            subject_clock_alert_dict[repl_subject].append(x['clock'])  # 去重 以subject为准
            # alert_dict[x['eventid']] = x['subject']
    # print count_alert_dict['fsdf']
    print u'problem 邮件条数' + str(problem_count)
    print u'总报警类型条数' + str(len(alert_dict))  # 总报警条数
    # print subject_clock_alert_dict
    dict1 = {}
    for v in subject_clock_alert_dict:
        s_b = re.sub(r"(.*on )(adrd-[0-9]+.[0-9]+.[0-9]+.[0-9]+)(.*)", r'\1', v)
        h_1 = re.sub(r"(.*on )(adrd-[0-9]+.[0-9]+.[0-9]+.[0-9]+)(.*)", r'\2', v)
        h_2 = re.sub(r"(.*on )(adrd-[0-9]+.[0-9]+.[0-9]+.[0-9]+)(.*)", r'\3', v)
        dict1[h_1] = subject_clock_alert_dict[v]
        count_clock_alert_dict_list[s_b + '*' + h_2].append({h_1: subject_clock_alert_dict[v]})  # 未排序
    # print count_clock_alert_dict_list['PROBLEM: Processor load is high on *']
    # s_ = sorted(count_clock_alert_dict_list['PROBLEM: countinfoh5 log upload fail on *'], key=lambda x:x.keys())
    # print count_clock_alert_dict_list
    for g in count_clock_alert_dict_list:
        ''' {u'PROBLEM: Processor load is high on *': [{u'adrd-10.16.3
        9.159': [u'1466061086']}, {u'adrd-10.16.39.148': [u'1466043140']}],..}'''
        # count = 0
        s_[g] = sorted(count_clock_alert_dict_list[g], key=lambda x: x.keys())  # 以主机名排序后的报警列表，值是个数组
        count = len(s_[g])
        # for n in s_[g]:
        #     # print n
        #     assert isinstance(n, dict)
        #     # print n.values()
        #     count += len(n.values()[0])
        if count == 1:
            print re.sub(r'\*', s_[g][0].keys()[0], g) + ' ' + str(len(s_[g][0].values()[0])),
            s_timestamp_0 = [time.strftime("%H:%M:%S", time.localtime(float(z))) for z in
                             sorted(s_[g][0].values()[0])]  # 排序后的时间戳
            for r in s_timestamp_0:
                print r,
            print
            for g_name_0 in a.gethostgroup(s_[g][0].keys()[0]):
                if g_name_0 not in ['adrd', 'adrd-Test', 'Discovered hosts', 'adrd-Test-And-Virtual-Server']:
                    print ' ' * 40 + g_name_0
            # print g, s_[g][0]
        else:
            # print g + ' ' + str(count)
            # print [z for x in s_[g] for y in x.values() for z in y]
            print g + ' ' + str(len([z for x in s_[g] for y in x.values() for z in y])) + ' ' + str(count)
            # print s_[g]
            for m in s_[g]:
                assert isinstance(m, dict)
                # print [time.strftime("%Y-%m-%d %H:%M:%S", time.localtime(float(z))) for z in sorted(m.values()[0])]
                print ' ' * 4 + m.keys()[0], len(m.values()[0]),  # adrd-10.16.39.90 4
                s_timestamp = [time.strftime("%H:%M:%S", time.localtime(float(z))) for z in
                               sorted(m.values()[0])]  # 排序后的时间戳
                for index, x in enumerate(s_timestamp):
                    if index == (len(s_timestamp) - 1):
                        print x
                    else:
                        print x,
                for g_name in a.gethostgroup(m.keys()[0]):
                    if g_name not in ['adrd', 'adrd-Test', 'Discovered hosts', 'adrd-Test-And-Virtual-Server']:
                        print ' ' * 40 + g_name
                    # print sorted(count_clock_alert_dict_list[g], key=lambda x:x.keys())
    print '=================================================================='
    print 'date_till ' + datetime_today, datetime_today_timestamp
    print 'date_from ' + datetime_yesterday, datetime_yesterday_timestamp
    # print a.gethostgroup('adrd-10.16.39.90')