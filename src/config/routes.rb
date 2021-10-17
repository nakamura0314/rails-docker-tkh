Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #どのURLに来たらどのコントローラーのどのアクションにリクエストを送るかの設定
  #getのトップページに来たら、usersのコントローラーのindexというアクションに通信を渡す
  get '/', to: 'users#index'
end
