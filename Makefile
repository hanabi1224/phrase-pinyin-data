.PHONY: help
help:
	@echo "merge          update pinyin.txt and large_pinyin.txt"
	@echo "er             find r"
	@echo "check          check unexpected char"

.PHONY: merge
merge: check
	python merge.py pinyin.txt overwrite.txt > new.txt && mv new.txt pinyin.txt
	python merge.py zdic_cibs.txt zdic_cybs.txt pinyin.txt overwrite.txt > new.txt && mv new.txt large_pinyin.txt

.PHONY: er
er:
	cat overwrite.txt|grep 儿|grep -v ér|grep -v er

.PHONY: tone_mark
tone_mark:
	ls *.txt | xargs -L 1 sed -i 's/ùo/uò/g'
	ls *.txt | xargs -L 1 sed -i 's/oǔ/ǒu/g'
	ls *.txt | xargs -L 1 sed -i 's/ùi/uì/g'
	ls *.txt | xargs -L 1 sed -i 's/íe/ié/g'
	ls *.txt | xargs -L 1 sed -i 's/ùi/uì/g'
	ls *.txt | xargs -L 1 sed -i 's/ǐe/iě/g'
	ls *.txt | xargs -L 1 sed -i 's/aō/āo/g'
	ls *.txt | xargs -L 1 sed -i 's/ìan/iàn/g'
	ls *.txt | xargs -L 1 sed -i 's/īan/iān/g'

.PHONY: check
check: tone_mark
	-rg 'ɡ|ɑ'
