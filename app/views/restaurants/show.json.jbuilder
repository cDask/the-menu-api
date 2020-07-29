json.restaurant do
    json.id @restaurant.id
    json.name @restaurant.name
    json.subdomain @restaurant.subdomain
    json.opening_hours @restaurant.opening_hours
    json.created_at @restaurant.created_at
    json.updated_at @restaurant.updated_at

    json.menus do
      json.array! @restaurant.menus do |menu|
        json.id menu.id
        json.title menu.title
        json.created_at menu.created_at
        json.updated_at menu.updated_at
        json.items do
          json.array! menu.items do |item|
            json.id item.id
            json.name item.name
            json.description item.description
            json.sizes item.sizes
            json.tags item.tags
            json.ingredients item.ingredients
            json.style item.style
          end
        end
        json.theme menu.theme
        json.style menu.style
      end
    end
    json.contact_infos @restaurant.contact_infos
end