import os
import shutil
import re

from PySide6.QtCore import QObject, Slot, Signal


def str2bool(s):
    if re.search(r'(?i)True', s):
        return True
    else:
        return False


def make_video_link(src_path, dst_path, copy_small_file_flag=True, exclude_suffix=None,
                    small_file_size=100 * 1024):
    if not os.path.exists(dst_path):
        os.makedirs(dst_path)
    files = os.listdir(src_path)
    for file in files:
        src = os.path.join(src_path, file)
        if os.path.isfile(src) and not file.endswith(exclude_suffix):
            dst = os.path.join(dst_path, file)
            if copy_small_file_flag and os.path.getsize(src) <= small_file_size:
                shutil.copy(src, dst)
            else:
                os.symlink(src, dst)


def renamer(src_path, season=1, begin=1, repetition=1):
    files = [file for file in os.listdir(src_path) if os.path.isfile(os.path.join(src_path, file))]
    tmp = 1
    for i, file in enumerate(files):
        src = os.path.join(src_path, file)
        new_file = f'S{season:>02d}E{begin:>02d} - {file}'
        dst = os.path.join(src_path, new_file)
        tmp += 1
        if tmp > repetition:
            tmp = 1
            begin += 1
        os.rename(src, dst)


def subtitle_renamer(src_path):
    files = os.listdir(src_path)
    for file in files:
        if re.search(r'(?i)tc.ass|cht.ass', file):
            os.remove(os.path.join(src_path, file))
        elif re.search(r'(?i)jpsc.ass', file):
            os.rename(os.path.join(src_path, file), os.path.join(src_path, re.sub(r'(?i)jpsc.ass', 'zh.ass', file)))
        elif re.search(r'(?i)jpchs.ass', file):
            os.rename(os.path.join(src_path, file), os.path.join(src_path, re.sub(r'(?i)jpchs.ass', 'zh.ass', file)))
        elif re.search(r'(?i)chs.ass', file):
            os.rename(os.path.join(src_path, file), os.path.join(src_path, re.sub(r'(?i)chs.ass', 'zh.ass', file)))
        elif re.search(r'(?i)sc.ass', file):
            os.rename(os.path.join(src_path, file), os.path.join(src_path, re.sub(r'(?i)sc.ass', 'zh.ass', file)))


class SymbolicLinkManager(QObject):
    sendMessage = Signal(str)

    def __init__(self):
        super(SymbolicLinkManager, self).__init__()
        self.options = {
            'src_path': '',
            'dst_path': '',
            'copy_small_file_flag': 'true',
            'small_file_size': 100 * 1024,
            'exclude_suffix': 'txt,zip,rar,7z',
            'prefix_flag': 'true',
            'multi_season': 'true',
            'season': 1,
            'begin': 1,
            'repetition': 1,
            'subtitle_flag': 'true',
            'year': '',
            'name': '',
        }

    def check(self):
        if not self.options['src_path']:
            self.sendMessage.emit("请选择输入文件夹")
            return False
        if not self.options['dst_path']:
            self.sendMessage.emit("请选择输出文件夹")
            return False
        if not self.options['name']:
            self.sendMessage.emit("请输入剧集名称")
            return False
        return True

    @Slot(str, str)
    def update_value(self, key, value):
        self.options[key] = value

    @Slot()
    def make_symbolic_link(self):
        if not self.check():
            pass
        else:
            try:
                excludes = tuple(self.options['exclude_suffix'].replace('，', ',').replace(' ', '').split(','))
                if self.options['year']:
                    dst_path = os.path.join(self.options['dst_path'], f'{self.options["name"]}({self.options["year"]})')
                else:
                    dst_path = os.path.join(self.options['dst_path'], f'{self.options["name"]}')
                if str2bool(self.options['multi_season']):
                    dst_path = os.path.join(dst_path, f"S{self.options['season']:>02d}")
                make_video_link(self.options['src_path'], dst_path,
                                copy_small_file_flag=str2bool(self.options['copy_small_file_flag']),
                                exclude_suffix=excludes,
                                small_file_size=int(self.options['small_file_size']))
                if str2bool(self.options['prefix_flag']):
                    renamer(dst_path,
                            season=int(self.options['season']),
                            begin=int(self.options['begin']),
                            repetition=int(self.options['repetition']))
                if str2bool(self.options['subtitle_flag']):
                    subtitle_renamer(dst_path)
                self.sendMessage.emit("完成")
            except:
                self.sendMessage.emit("发生错误")
            # print(self.options)
