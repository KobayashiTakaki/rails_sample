require 'faker'

desc 'サンプルデータ作成'

task create_sample_data: :environment do
  # User作成
  100.times do
    User.create!(
      name: Faker::Name.name,
      email: Faker::Internet.unique.email
    )
  end

  # Shop作成
  10.times do
    Shop.create!(
      name: Faker::Company.name
    )
  end

  # Product作成
  1000.times do
    Product.create!(
      name: Faker::Commerce.unique.product_name,
      unit_price: Random.rand(100..15000)
    )
  end

  # ProductStock作成
  product_size = Product.all.size

  Shop.all.each do |shop|
    products =
      Product
      .order(%i(name unit_price).sample)
      .offset(Random.rand(0..(product_size - 10)))
      .limit(10)
    products.each do |product|
      ProductStock.create!(
        shop_id: shop.id,
        product_id: product.id,
        amount: Random.rand(0..100)
      )
    end
  end

  # Purchase作成
  user_size = User.all.size
  half_user_size = (user_size.to_f / 2).floor
  product_stock_size = ProductStock.all.size
  3.times do
    users =
      User
      .order(%i(name email).sample)
      .offset(Random.rand(0..half_user_size))
      .limit(half_user_size)

    users.each do |user|
      Random.rand(1..10).times do |i|
        product_stock =
          ProductStock
            .order(%i(product_id shop_id amount).sample)
            .offset(Random.rand(0..(product_stock_size - 1)))
            .first
        product = Product.find(product_stock.product_id)
        Purchase.create!(
          user_id: user.id,
          shop_id: product_stock.shop_id,
          product_id: product_stock.product_id,
          unit_price: product.unit_price,
          amount: Random.rand(1..3)
        )
      end
    end
  end

  # ProductReview作成
  purchase_size = Purchase.all.size
  50.times do
    limit = Random.rand(5..15)
    purchases =
      Purchase
      .order(:unit_price)
      .offset(Random.rand(0..(purchase_size - limit)))
      .limit(limit)
    purchases.each do |purchase|
      ProductReview.create!(
        user_id: purchase.user_id,
        product_id: purchase.product_id,
        content: Faker::Quote.famous_last_words
      )
    end
  end
end
