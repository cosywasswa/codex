require 'swagger_helper'
describe 'Users API' do
    path '/users' do
        post 'Registers a new user' do
            tags 'users'
            consumes 'application/json'
            parameter name: :user, in: :body, schema: {
                type: :object,
                properties: {
                    name: {type: :string},
                    email: { type: :string },
                    password: { type: :string }
                },
            required: ['name', 'email', 'password' ]
            }
            response '200', 'created successfuly' do
                let(:user){User.create(name: 'Cosmas', email: '12@gmail.com', password: '1234567')}
                run_test!
            end
        end
    end
    path '/users/sign_in' do
        post 'signs in a user' do
            tags 'user'
            consumes 'application/json'
            parameter name: :user, in: :body, schema: {
                type: :object,
                properties: {
                   email: {type: :string},
                   password: {type: :string}
                },
            required: ['email', 'password' ]
            }
            response '200', 'signed in successfuly' do
                let(:user){{email: '12@gmail.com', password: '1234567'}}
                run_test!
            end
        end
    end
end
