

#random names
5.times do
  User.create(name: Faker::Name.name)
end

#random locations
new_york =  Location.create(state: "New York")
florida = Location.create(state: "Florida")
california = Location.create(state: "California")
#ohio = Location.create(state: "Ohio")
#pennsylvania = Location.create(state: "Pennsylvania")


#facts
fla_fact1 = Fact.create(location_id: florida.id, fact: "Increase comfort and reduce energy consumption by controlling the indoor temperature. \n You can control the temperature in your living space by installing low cost, easy-to-use thermostats and automatic radiator controls that will save energy and increase comfort. \n Insulate your windows by installing storm windows, which will reduce drafts and lower your energy bills." )
fla_fact2 = Fact.create(location_id: florida.id, fact: "If you want to be more sustainable why not start at your home? Make sure your home has adequate insulation and energy-saving windows, and use a programmable thermostat for more efficient heating and cooling — and, of course, energy-saving lightbulbs for more efficient lighting.")
fla_fact3 = Fact.create(location_id: florida.id, fact: "Have a garden and want to create rich soil. Try composting! For one, it’s free. You get to use kitchen waste, lawn clippings, leaves and other vegetation that would otherwise get thrown away. In fact, you might even save money on landfill fees.")

nyc1 = Fact.create(location_id: new_york.id, fact: "Shop at farmers’ markets. Eating local is good to lower food miles. Meaning lowering the distance food must travel before it ends up on your plate. These little changes can make a strong difference in the environment.")
nyc2 = Fact.create(location_id: new_york.id, fact: "Recycling is one of the easiest ways to 'go green' and promote sustainability in the city. GrowNYC has sponsored city-wide recycling initiatives by putting curbside recycling bins all over the city.")
nyc3 = Fact.create(location_id: new_york.id, fact: "Stay in NYC. Although it may seem counterintuitive, living in dense,
urban cities is one of the best ways to help the environment. Our reliance on mass transit and smaller living spaces have made New York the most energy-efficient city in the United States. ")
nyce4 = Fact.create(location_id: new_york.id, fact: "Use non-toxic materials and products. Here’s a good rule of thumb: If it’s
poisonous, carcinogenic, triggers asthma or damages your nervous system, you probably don’t want it in your living space.")

cali1 = Fact.create(location_id: california.id, fact: "Saving the environment can be as easy as paying attention to your labels when buying something. From fruit to clothing We know all of the many labels can be overwhelming but there are some clear leaders when it comes to minimizing your impact on wildlife and the planet. If you’re a coffee drinker, look for “shade-grown” coffee, which is grown while keeping forest habitats intact for migratory birds and other species. Choose Fair Trade certified goods when possible to support companies dedicated to sustainable production and paying laborers a fair wage. Buy organic food whenever possible; it may cost a little more, but it keeps harmful pesticides out of our land and water, protecting farm workers, wildlife and your family.")
cali2 = Fact.create(location_id: california.id, fact: "Monitoring techniques are another easy way to make a change. Try keeping track of the energy you use when looking at your power bill, aiming for lower targets every month.")
cali3 = Fact.create(location_id: california.id, fact: "Try changing your diet. Cutting back on your consumption of meat can make a huge difference in the environment. More than 30 percent of the Earth’s surface is being used to raise and support livestock. Cutting back on your meat consumption is an important step in reducing the overall emission of GWP gases. Less livestock also means more land we can enjoy and use for recreation. Consider replacing some of your meat-heavy meals with vegetables or eating more seafood!")
