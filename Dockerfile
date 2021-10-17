FROM ruby:2.7

#ENV 環境変数=値　で、環境変数を設定する
ENV RAILS_ENV=production

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update -qq \
    && apt-get install -y nodejs yarn
WORKDIR /app
COPY ./src /app
RUN bundle config --local set path 'vendor/bundle' \
    && bundle install

COPY start.sh /start.sh
#chmod 権限 ファイル名　で権限を設定する
#r(読出)=4,w(書込)=2,x(実行)=1として、[所有者][グループ][その他]の順に、与える権限の合計値を書く
RUN chmod 744 /start.sh
#shはシェルスクリプトの拡張子で、
#シェルスクリプトとはコンピュータに命令を実行してくれるシェルに渡す、命令を一つにまとめたファイルのこと
CMD ["sh", "/start.sh"]
