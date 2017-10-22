require 'rack/jsonp'

module ContactRequestApi
  class V1::ContactRequest < Grape::API
    use Rack::JSONP

    helpers do
      params :token do
        optional :token, type: String, default: nil,
        documentation: {
          type: 'String',
          desc: 'Authenticate token'
        }
      end

      params :attributes do
        optional :attributes, type: Hash, default: {},
        documentation: {
          type: 'Hash',
          desc: 'Params attributes of contact request'
        }
      end
    end

    resource :contact_requests do
     desc 'REST GET with no parameters.' do
        detail <<-NOTE
            Make a query for products.
            -----------------
            Returns an array of all contact requests.
          NOTE
      end
      get do
        api_response(::ContactRequest.all.to_json)
      end

      route_param :id do
        desc 'REST GET with id param.' do
          detail <<-NOTE
              Make a query for a contact request with certain id.
              -----------------
              Returns the result of query for a contact request.
            NOTE
        end

        params do
          use :token, type: String, desc: 'Authentication token'
          requires :id, type: Integer, desc: "Contact Request ID"
        end
        get do
          begin
            authenticate!

            contact_request = ::ContactRequest.find(params[:id])
            api_response(contact_request.to_json)
          rescue ActiveRecord::RecordNotFound => e
            status 404 # Not found
          end
        end
      end

      desc 'REST Post with attributes param.' do
        detail <<-NOTE
          Creates a contact request with the information passed through attributes param.
          -----------------
          This is a hash, with the estruture:
          ```
            {"name": "Example", "email": "email@email.com", "subject": "url", "comment": "Share your thoughts"}
          ```
        NOTE
      end
      params do
        use :token
        requires :attributes, type: Hash, desc: 'contact request object to create' do
          requires :name, type: String, desc: 'Name of requester'
          requires :email, type: String, desc: 'Email of requester'
          requires :subject, type: String, desc: 'Subject of contact request'
          requires :comment, type: String, desc: 'Comment of contact request'
        end
      end
      post do
        begin
          authenticate!
          safe_params = clean_params(params[:attributes])
                        .permit(:name, :email, :subject, :comment)

          if safe_params
            ::ContactRequest.create!(safe_params)
            status 200 # Saved OK
          end
        rescue ActiveRecord::RecordNotFound => e
          status 404 # Not found
        end
      end

      params do
        use :token, type: String, desc: 'Authentication token'
        requires :id, type: Integer, desc: "Contact Request ID"
        requires :attributes, type: Hash, desc: 'Contact Request object to create' do
          requires :name, type: String, desc: 'Name of requester'
          requires :email, type: String, desc: 'Email of requester'
          requires :subject, type: String, desc: 'Subject of contact request'
          requires :comment, type: String, desc: 'Comment of contact request'

        end
      end
      put ':id' do
        begin
          authenticate!
          safe_params = clean_params(params[:attributes]).permit(:name, :email, :subject, :comment)

          if safe_params
            contact_request = ::ContactRequest.find(params[:id])
            contact_request.update_attributes(safe_params)
            status 200 # Saved OK
          end
        rescue ActiveRecord::RecordNotFound => e
          status 404 # Not found
        end
      end
    end

  end
end
