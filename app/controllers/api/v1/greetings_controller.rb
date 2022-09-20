class Api::V1::GreetingsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    @greeting = Greeting.order('RANDOM()').first
    render json: GreetingSerializer.new(@greeting).serialized_json
  end

  def update
    @greetings_list = [
      { title: 'Conitchiwa', name: 'Japanese greeting' },
      { title: 'Hello', name: 'Is there any body' },
      { title: 'How are you doing', name: 'When It\'s been while' },
      { title: 'What\'s up', name: 'American\'s street greeting' },
      { title: 'Hi', name: 'Short form of hello, for friends' }
    ]

    @greetings_list.each do |greeting|
      Greeting.create(name: greeting[:title], message: greeting[:name]) unless Greeting.find_by(name: greeting[:title])
    end
    @greeting = Greeting.order('RANDOM()').first
    render json: GreetingSerializer.new(@greeting).serialized_json
  end
end
