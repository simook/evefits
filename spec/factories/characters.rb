FactoryGirl.define do
  factory :character do |f|
    f.association :user, factory: :user
    f.apikey "2225640"
    f.apicode "czfcIpp7UnMROed5WInkZco8JJhnP3aFWgJaSyYcLADRN1xm4ztsTK7lQLYMAmPd"
    f.expires "2014-06-05 18:16:20"
    f.accessMask "8"
    f.characterName "red cour"
    f.characterID "92447465"
    f.corporationName "Dangerous Metaphysical Productions"
    f.corporationID "98044207"
  end
end