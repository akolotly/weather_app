# README

Weather app - веб-приложение на Ruby для получения прогнозы погоды по городу, выбранному из списка доступных городов. 

## Требования:
```
ruby '2.5.0'
posrgres 
```

## Инструкция по установке:
```
bundle 
rails db:create
rails db:migrate
rails db:seed 
Теперь можно залогинится “foo@mail.ru”, password: 111111
```

## Для проверки кода: 
```
rspec spec
bundle-audit update && bundle exec bundle-audit check
brakeman --exit-on-warn
rubocop 
```

Приложение доступно обычным пользователям и пользователям-администраторам, которые могут заходить в админку через ссылку “Вход” в шапке сайта, указывая логин и пароль.

Администраторы могут изменять, удалять и создавать других администраторов, указывая логин и пароль при создании userа. А также доступна функция просмотра своего профиля.

Также администраторы могут добавлять в список доступных городов новые города, создавая модель City и указывая при создании:
- имя города;
- широта, координаты в градусах;   
- долгота, координаты в градусах;
- часовой пояс, который выбирается из заданного списка.

При создании ресурса User используется gem sorcery, который предоставляет в перспективе более гибкую настройку модели User.
Дополнительно для создания “админки” в связке с sorcery установлен gem activeadmin. Благодаря которому сокращается написание кода и экономится время на разработку приложения. При желании в будущем можно убрать гем и написать свою, более гибкую модель администратора и его прав. 


Узнать прогноз погоды можно нажав на имя города из списка, либо перейдя по ссылке “Узнать погоду”.

Для получения прогнозы погоды используется gem open-weather, который запрашивает прогноз на 5 дней с разбивной по 3 часа с сайта https://openweathermap.org/, через запрос API.
Гемфайл отдает сразу ответ в формате хэша, что позволяет ускорить разработку. 

При разработке также использовались gem:
- capybara, rspec-rails, pry, factory_bot_rails, для удобного тестирования;
- rubocop, для соответсвия Ruby Style Guide;
- bundler-audit, проверяет гемы на уязвимости;
- brakeman, проверяет приложение на уязвимости;

Так же добавлен CircleCI, который проверяет при новом pull request код rubocopом, автоматически прогоняет тесты и обновляет данные на heroku. 

Для автоматизированного развертывания используется heroku:
https://dashboard.heroku.com/apps/shielded-coast-16096
Войти на сайт под администратором можно через аккаунт test@mail.ru/ password:111111.

Это решение тестового задания: http://telegra.ph/Testovoe-zadanie-06-19

## TODO:

Для улучшения приложения в будущем можно:
- отображение метки города на карте в интерфейсе;
- добавление пагинации страниц в “админке” и на странице, показывающей список всех городов;
- скрыть и обновить APPID, используемый гемом open-weather из GitHub.
