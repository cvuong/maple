class Maple.Models.Company extends Backbone.Model
  paramRoot: 'company'
  urlRoot: '/companies'

  initialize: ->
    @posts = new	Maple.Collections.PostsCollection
    @posts.url = '/posts'
    @followers = new Maple.Collections.UsersCollection
    @campaigns = new Maple.Collections.CampaignsCollection
    @campaigns.url = '/companies/' + @id + '/campaigns' 

class Maple.Collections.CompaniesCollection extends Backbone.Collection
  model: Maple.Models.Company
  url: '/companies'
