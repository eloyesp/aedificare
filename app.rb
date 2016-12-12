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
    on 'panel' do
      if req.session['email']
        res.write 'hola'
      else
        res.redirect('/ingreso')
      end
    end
    on 'ingreso' do
      render 'formulario_ingreso'
    end
    on 'debug' do
      res.write req.session.to_hash.inspect
    end
  end
end
