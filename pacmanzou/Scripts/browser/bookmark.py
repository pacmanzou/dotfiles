import sys
import json


def get_chrome_bookmark_list(items):
    def _get_bookmark_list(items, path):
        return_list = []

        if isinstance(items, list):
            for item in items:
                return_list += _get_bookmark_list(item, path + item["name"])

        if isinstance(items, dict):
            if not (("name" in items) and ("type" in items)):
                return return_list

            if items["type"] == "folder":
                return_list += _get_bookmark_list(items["children"], path)
            else:
                bookmark = {
                    "pathname": path,
                    "name": items["name"],
                    "url": items["url"],
                }
                return_list.append(bookmark)

        return return_list

    return _get_bookmark_list(items, "")


def usage(program_name):
    print("usage: " + program_name + " {--name|--url} [bookmark_file]")


if __name__ == "__main__":
    argvs = sys.argv
    argc = len(argvs)

    name_mode = url_mode = False
    bookmark_filename = "Bookmarks.json"
    if argc >= 2:
        if argvs[1] == "--name":
            name_mode = True
        elif argvs[1] == "--url":
            url_mode = True
        else:
            usage(argvs[0])
            quit()

        if argc >= 3:
            bookmark_filename = argvs[2]
    else:
        usage(argvs[0])

    with open(bookmark_filename) as file:
        data = json.load(file)

    bookmark_list = get_chrome_bookmark_list(data["roots"]["bookmark_bar"])
    bookmark_list += get_chrome_bookmark_list(data["roots"]["other"])

    if name_mode is True:
        for index, bookmark in enumerate(bookmark_list, 1):
            print("{0:02}".format(index) + ":" + bookmark["pathname"])

    if url_mode is True:
        for index, bookmark in enumerate(bookmark_list, 1):
            print("{0:02}".format(index) + ":" + bookmark["url"])
