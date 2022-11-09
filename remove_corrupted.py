import os

images_dir = os.getcwd() + "/images"
flags = ["droids", "html"]
categories = os.listdir(images_dir)

for category in categories:
    path = images_dir + "/" + category
    files = os.listdir(path)
    for f in files:
        curr_file = open(path + "/" + f, 'r')
        try:
            lines = " ".join(curr_file.readlines())
            for flag in flags:
                if flag in lines:
                    try:
                        curr_file.close()
                        os.remove(path + "/" + f)
                    except OSError as e:
                        print("Failed with:" + e.strerror)
                        print("Error code:" + e.code)

        except:
            pass