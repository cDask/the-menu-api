p 'seeding 🌱'

p 'users 🤷‍♂️'

3.times do |c|
  if c == 2 
  user = User.create(
    email: "test@test.com",
    password: "testpass",
    full_name: "Full Test Name"
  )
  else
  user = User.create(
    email: Faker::Internet.email,
    password: "8characters",
    full_name: Faker::Name.name
  )
  end

  p "#{user.full_name} has created an account"

  # NOTE if seeding fails, it's because faker generated the same name, 
  # restaurant model fails to validate name uniqueness
  res_name = Faker::Restaurant.name
  res = Restaurant.create(
    name: res_name,
    user: user,
    opening_hours: '{"opening_hours":[{"day":"Monday","opening_hours":{"open_hr":"11","open_min":"00","open_ampm":"am"},"closing_hours":{"close_hr":"10","close_min":"00","close_ampm":"pm"}}]}',
    subdomain: res_name
  )

  ContactInfo.create(
    name: "phone number",
    info_type: "phone number",
    info: Faker::PhoneNumber.phone_number.to_str,
    restaurant: res
  )
  ContactInfo.create(
    name: "Address",
    info_type: "Address",
    info: Faker::Address.full_address,
    restaurant: res
  )

  Theme.create(
    theme_class: ["minimal", "bold", "colourful"].sample,
    themeable: res
  )

  Style.create(
    style_data: '{"foreground":"#FFFFFF","background":"#000000","color":"#811616","border":"#b929b2","header":"#b02b3e"}',
    styleable: res
  )

  p "and a Restaurant called #{res.name}, with the #{res.theme.theme_class} theme and a style of #{res.style.style_data}"

  2.times do
    menu = Menu.create(
      title: ["lunch", "evening", "brunch"].sample,
      restaurant: res
    )
    Theme.create(
      theme_class: ["minimal", "bold", "colourful"].sample,
      themeable: menu
    )
    Style.create(
      style_data: '{"foreground":"#FFFFFF","background":"#000000","color":"#811616","border":"#b929b2","header":"#b02b3e"}',
      styleable: res
    )
    5.times do 
      item = Item.create(
        name: Faker::Food.dish,
        description: Faker::Food.description,
        menu: menu
      )
      Theme.create(
      theme_class: ["minimal", "bold", "colourful"].sample,
      themeable: item
      )
      
      Style.create(
        style_data: "{
          'headerColour': #{Faker::Color.hex_color},
          'textColour': #{Faker::Color.hex_color},
          'backgroundColour': #{Faker::Color.hex_color},
          'foregroundColour': #{Faker::Color.hex_color} 
          }",
        styleable: item
      )

      tag = Tag.create(
        name: ["takeaway available", "main", "entrée"].sample
      )
      ItemTag.create(
        primary: true,
        tag: tag,
        item: item
      )
      2.times do 
        tag = Tag.create(
          name: ["vegetarian", "gluten free", "helfy"].sample
        )
        ItemTag.create(
          tag: tag,
          item: item
        )
      end

      rand(4).times do 
        Size.create(
          name: ["hella big", "whoppa™", "bebe"].sample,
          price: rand(1000..50000),
          item: item
        )
      end

      rand(5).times do 
        Ingredient.create(
          name: Faker::Food.ingredient,
          item: item
        )
      end
    end 
    p "a #{menu.title} menu with #{menu.items.length} items. its theme is #{menu.theme.theme_class}"
  end
end
