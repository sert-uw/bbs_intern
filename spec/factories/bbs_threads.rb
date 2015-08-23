FactoryGirl.define do
  factory :bbs_thread do
    name "testUser"
    address "test@test.test"
    title "Test thread"
    body "This is test."
    password "testpass"
  end

  factory :bbs_thread2, class: BbsThread do
    name "testUser2"
    address "test2@test.test"
    title "Test thread2"
    body "This is test2."
    password "testpass2"
  end
end
