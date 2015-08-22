json.array!(@bbs_threads) do |bbs_thread|
  json.extract! bbs_thread, :id, :name, :address, :title, :body, :password
  json.url bbs_thread_url(bbs_thread, format: :json)
end
