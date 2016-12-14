Blog 예제

1. database.yml 파일에서 local database 정보 넣어주셔야 합니다. ( local db 에 접근 가능한 username, password )
2. bundle install
3. rake db:create
4. rake db:migrate
5. rails s

# Serializer 추가
  1. gem 'active_model_serializers', '~> 0.10.0'
  2. config/initializers/ams.rb 파일 추가
