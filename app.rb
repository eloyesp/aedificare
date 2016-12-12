require 'cuba'
require 'cuba/safe'
require 'cuba/render'
require 'erb'

Cuba.plugin Cuba::Safe
Cuba.plugin Cuba::Render

Cuba.define do
  on root do
    render('landing_page')
  end
  on 'panel' do
    if req.session['email']
      render 'panel'
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

  on 'enviar_email', param('email') do |email|
    puts email
    puts 'enviar email'
    render 'email_enviado', token: 'bla'
  end

  on 'ingresar', param('token') do |token|
    puts 'validate token'
    req.session['email'] = 'sample@here'
    res.redirect '/panel'
  end

  on 'salir' do
    req.session.clear
    res.redirect '/'
  end
end
