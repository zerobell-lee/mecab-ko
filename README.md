# Docker Image : Mecab-Ko

## Overview

It is a docker image that contains eunjeon/mecab-ko, eunjeon-mecab-ko-dic. You can add Japanese dics such as ipadic, or jumandic if you want. If you want to add Japanese Dics, download it from [http://taku910.github.io/mecab/](http://taku910.github.io/mecab/) and add it to Docker container. 


It is a little bit complex to download Japanese dics with cla command since they are deployed on Google Drive.

## How to get this

<pre>$ docker pull zerobell/mecab-ko:latest</pre>

## How to use this

Default Usage

<pre>$ docker run --rm -it zerobell/mecab-ko:latest
안녕하세요. 만나서 반갑습니다.
안녕	NNG,행위,T,안녕,*,*,*,*
하	XSV,*,F,하,*,*,*,*
세요	EP+EF,*,F,세요,Inflect,EP,EF,시/EP/*+어요/EF/*
.	SF,*,*,*,*,*,*,*
만나	VV,*,F,만나,*,*,*,*
서	EC,*,F,서,*,*,*,*
반갑	VA,*,T,반갑,*,*,*,*
습니다	EF,*,F,습니다,*,*,*,*
.	SF,*,*,*,*,*,*,*
EOS
</pre>

With Japanese Dics (Jumandic example)

<pre>$ docker run --rm -it zerobell/test:latest mecab -d /usr/local/lib/mecab/dic/jumandic
この番組は楽しい時を作る企業バンダイと、ご覧のスポンサーの提供でお送りします。
この	指示詞,連体詞形態指示詞,*,*,この,この,*
番組	名詞,普通名詞,*,*,番組,ばんぐみ,代表表記:番組/ばんぐみ カテゴリ:抽象物 ドメイン:メディア
は	助詞,副助詞,*,*,は,は,連語
楽しい	形容詞,*,イ形容詞イ段,基本形,楽しい,たのしい,代表表記:楽しい/たのしい
時	名詞,副詞的名詞,*,*,時,とき,代表表記:時/とき
を	助詞,格助詞,*,*,を,を,連語
作る	動詞,*,子音動詞ラ行,基本形,作る,つくる,代表表記:作る/つくる
企業	名詞,普通名詞,*,*,企業,きぎょう,連語
バンダイ	名詞,普通名詞,*,*,*,*,*
と	助詞,格助詞,*,*,と,と,連語
、	特殊,読点,*,*,、,、,*
ご覧	名詞,普通名詞,*,*,ご覧,ごらん,代表表記:御覧/ごらん カテゴリ:抽象物
の	助詞,接続助詞,*,*,の,の,連語
スポンサー	名詞,普通名詞,*,*,スポンサー,すぽんさー,代表表記:スポンサー/すぽんさー カテゴリ:人 ドメイン:ビジネス;政治
の	助詞,接続助詞,*,*,の,の,連語
提供	名詞,サ変名詞,*,*,提供,ていきょう,代表表記:提供/ていきょう カテゴリ:抽象物
で	助詞,格助詞,*,*,で,で,連語
お	接頭辞,名詞接頭辞,*,*,お,お,連語
送り	動詞,*,子音動詞ラ行,基本連用形,送る,おくり,代表表記:送る/おくる 反義:動詞:迎える/むかえる
し	動詞,*,サ変動詞,基本連用形,する,し,連語
ます	接尾辞,動詞性接尾辞,動詞性接尾辞ます型,基本形,ます,ます,代表表記:ます/ます
。	特殊,句点,*,*,。,。,*
EOS</pre>

## Advanced Usage

### with Python wrapper

You can make your own image. Install **pip3**, and any mecab-ko python wrapper. I recommend to use [python-mecab-ko](https://pypi.org/project/python-mecab-ko/).

### Adding Customized Dictionaries.

Refer [here](https://bitbucket.org/eunjeon/mecab-ko-dic/src/df15a487444d88565ea18f8250330276497cc9b9/final/user-dic/README.md?fileviewer=file-view-default). In this image, mecab-ko-dic remains, not removed. So if you want to add your custom words, Just use <code>docker exec -it \[containerName\] bash</code> and make your own dictionaries.