
module FlickrHelper
  
  def user_photos(user_id, photo_count = 12)
    flickr.photos.search(:user_id => user_id).first(photo_count)
  end
  
  def get_name_id(username)
    begin
      flickr.people.findByUsername(:username => username)     
    rescue => exception
      render :partial => '/flickr/unavailable'
    end
  end
  
  def render_flickr_sidebar_widget(user_id, photo_count = 12, columns = 2)
    begin
      puts "step 1"
      photos = user_photos(user_id, photo_count).in_groups_of(columns)
      puts "step 2"
      render :partial => '/flickr/sidebar_widget',
             :locals  => { :photos => photos }
    rescue Exception
      puts "step 3"
      render :partial => '/flickr/unavailable'
    end
  end
  
end