module RequestHelpers
  def stub_client_token_header
    valid_token = 'S3CR3TT0K3N'
    stub_const('ENV', 'CLIENT_TOKEN' => valid_token)

    request.headers['HTTP_CLIENT_TOKEN'] = valid_token
  end
end
