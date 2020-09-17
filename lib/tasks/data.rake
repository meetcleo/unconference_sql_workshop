
namespace :data do
  task generate_a_little: [:environment] do
    generate_data(10)
  end

  task generate_a_lot: [:environment] do
    generate_data(10_000)
  end

  NAMES = ['Dade Murphy', 'Kate Libby', 'Joey Pardella', 'Emmanuel Goldstein', 'Paul Cook', 'Ramόn Sánchez', 'Eugene Belford', 'Margo Wallace'].freeze
  MULTIPLIERS = [nil, -1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]

  def generate_data(number_of_users)
    FirebaseToken.delete_all
    Message.delete_all
    User.delete_all

    user_data = (1..number_of_users).map do |number|
      name = NAMES.sample + number.to_s
      snooze_until = MULTIPLIERS.sample.then { |multiplier| multiplier ? (DateTime.current + multiplier * Random.rand(8760).hours) : nil }
      {
        id: number,
        name: name,
        email: name.downcase.delete(' ') + '@meetcleo.com',
        snooze_until: snooze_until
      }
    end
    User.insert_all(user_data)

    message_data = (1..number_of_users).flat_map do |user_number|
      (1..Random.rand(100)).map do |_|
        {
          user_id: user_number,
          body: %w[There is no right and wrong Theres only fun and boring He lp].sample(5).shuffle.join([' ', ''].sample)
        }
      end
    end
    Message.insert_all(message_data)

    firebase_token_data = (1..number_of_users).flat_map do |user_number|
      (1..Random.rand(10)).map do |_|
        invalidated_at = MULTIPLIERS.sample.then { |multiplier| multiplier ? (DateTime.current + multiplier * Random.rand(8760).hours) : nil }
        {
          user_id: user_number,
          invalidated_at: invalidated_at
        }
      end
    end
    FirebaseToken.insert_all(firebase_token_data)
  end
end
