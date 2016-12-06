require 'cuba'
require 'cuba/safe'
require 'cuba/render'
require 'erb'

Cuba.plugin Cuba::Safe
Cuba.plugin Cuba::Render

Cuba.define do
  on get do
    on root do
      render('landing_page')
    end
  end
end
