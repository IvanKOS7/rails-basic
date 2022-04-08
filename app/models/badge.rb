class Badge < ApplicationRecord
  ROOT_ENDPOINT = "https://img.shields.io/static/v1?"


  has_and_belongs_to_many :users
  # { label: "hello jjjjb",
  #   message: "Jojojo",
  #   color: "green",
  #   logoColor: "gold",
  #    logo: "streamlit"}
  #after_action
   #full_url = "https://img.shields.io/static/v1?logo="streamlit"&logoColor="gold"&color=#{badge.color}&label=#{badge.label}&message=#{badge.message}"



end
