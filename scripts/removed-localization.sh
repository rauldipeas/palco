#!/bin/bash
set -e
# Idiomas não usados
printf 'dictionaries-common dictionaries-common/default-ispell select pt-br' | sudo debconf-set-selections
sudo apt autoremove --purge -y \
	aspell-am aspell-ar aspell-ar-large \
	aspell-bg aspell-ca aspell-cs \
	aspell-cy aspell-da aspell-de \
	aspell-el aspell-eo aspell-es \
	aspell-et aspell-eu aspell-fa \
	aspell-fr aspell-ga aspell-gl-minimos \
	aspell-he aspell-hr aspell-hu \
	aspell-is aspell-it aspell-kk \
	aspell-ku aspell-lt aspell-lv \
	aspell-nl aspell-no aspell-pl \
	aspell-pt-pt aspell-ro aspell-ru \
	aspell-sk aspell-sl aspell-sv \
	aspell-tl aspell-uk \
	fonts-noto-cjk fonts-noto-extra fonts-noto-ui-extra \
	hunspell-de-ch* hunspell-gu* hunspell-ko* hunspell-ru* \
	hunspell-ar* hunspell-de-de* hunspell-hi* hunspell-lt* hunspell-si* \
	hunspell-be* hunspell-el* hunspell-hr* hunspell-lv* hunspell-sl* \
	hunspell-bg* hunspell-en-gb* hunspell-hu* hunspell-ne* hunspell-sr* \
	hunspell-bs* hunspell-en-us* hunspell-id* hunspell-nl* hunspell-sv* \
	hunspell-ca* hunspell-eo* hunspell-is* hunspell-pl* hunspell-te* \
	hunspell-cs* hunspell-eu* hunspell-it* hunspell-th* \
	hunspell-da* hunspell-fr-classical* hunspell-kk* hunspell-pt-pt* hunspell-vi* \
	hunspell-de-at* hunspell-gl* hunspell-kmr* hunspell-ro* \
	iamerican* ibritish* ibulgarian* \
	icatalan* idanish* idutch* \
	ienglish-common* ifrench-gut* ihungarian* \
	iitalian* ilithuanian* ingerman* \
	inorwegian* ipolish* iportuguese* \
	irussian* ispanish* iswiss* \
	task-albanian-desktop task-amharic task-amharic-desktop \
	task-arabic task-arabic-desktop task-asturian \
	task-asturian-desktop task-basque task-basque-desktop \
	task-belarusian task-belarusian-desktop task-bengali \
	task-bengali-desktop task-bosnian task-bosnian-desktop \
	task-british-desktop task-bulgarian task-bulgarian-desktop \
	task-catalan task-catalan-desktop task-chinese-s \
	task-chinese-s-desktop task-chinese-t task-chinese-t-desktop \
	task-croatian task-croatian-desktop task-cyrillic \
	task-cyrillic-desktop task-czech task-czech-desktop \
	task-danish task-danish-desktop task-dutch \
	task-dutch-desktop task-dzongkha-desktop task-esperanto \
	task-esperanto-desktop task-estonian task-estonian-desktop \
	task-finnish task-finnish-desktop task-french \
	task-french-desktop task-galician task-galician-desktop \
	task-georgian-desktop task-german task-german-desktop \
	task-greek task-greek-desktop task-gujarati \
	task-gujarati-desktop task-hebrew task-hebrew-desktop \
	task-hebrew-gnome-desktop task-hindi task-hindi-desktop \
	task-hungarian task-hungarian-desktop task-icelandic \
	task-icelandic-desktop task-indonesian-desktop task-irish \
	task-irish-desktop task-italian task-italian-desktop \
	task-japanese task-japanese-desktop task-japanese-gnome-desktop \
	task-kannada-desktop task-kazakh task-kazakh-desktop \
	task-khmer task-khmer-desktop task-korean \
	task-korean-desktop task-korean-gnome-desktop task-kurdish \
	task-kurdish-desktop task-latvian task-latvian-desktop \
	task-lithuanian task-lithuanian-desktop task-macedonian \
	task-macedonian-desktop task-malayalam task-malayalam-desktop \
	task-malayalam-gnome-desktop task-marathi task-marathi-desktop \
	task-nepali-desktop task-northern-sami task-northern-sami-desktop \
	task-norwegian task-norwegian-desktop task-persian \
	task-persian-desktop task-polish task-polish-desktop \
	task-portuguese task-portuguese-desktop task-punjabi \
	task-punjabi-desktop task-romanian task-romanian-desktop \
	task-russian task-russian-desktop task-serbian \
	task-serbian-desktop task-sinhala-desktop task-slovak \
	task-slovak-desktop task-slovenian task-slovenian-desktop \
	task-south-african-english-desktop task-spanish task-spanish-desktop \
	task-swedish task-swedish-desktop task-tagalog \
	task-tamil task-tamil-desktop task-tamil-gnome-desktop \
	task-telugu task-telugu-desktop task-telugu-gnome-desktop \
	task-thai task-thai-desktop task-thai-gnome-desktop \
	task-turkish task-turkish-desktop task-ukrainian \
	task-ukrainian-desktop task-uyghur-desktop task-vietnamese-desktop \
	task-welsh task-welsh-desktop task-xhosa-desktop