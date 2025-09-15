# vacancy_scout
bot for checking of vacs

some snippets:
`dropdb vacancy_scout_test`
`dropdb vacancy_scout_development`
`createdb vacancy_scout_test`
`createdb vacancy_scout_development`
`createdb vacancy_scout_production`

`rake "db:new_migration[create_employers]"`
`rake "db:new_migration[create_vacancies]"`

`rake db:migrate RACK_ENV=test`
`rake db:migrate RACK_ENV=development`
