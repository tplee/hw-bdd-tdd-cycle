require 'rails_helper'
require 'spec_helper'

describe MoviesController do
    describe "#director" do
        context "When the specified movie has a director" do
          
            it "should find movies with the same director" do 
                @movie_id = "1234"
                @movie = double('fake_movie', :director => 'James Cameron')
                expect(Movie).to receive(:find).with(@movie_id).and_return(@movie)
                expect(@movie).to receive(:similar_movies)
                get :director, :id => @movie_id
                expect(response).to render_template(:director)
            end
        end
        context "When the specified movie has no director" do
            it "should redirect to the movies page" do 
                @movie_id = "1234" 
                @movie = double('fake_movie').as_null_object
                expect(Movie).to receive(:find).with(@movie_id).and_return(@movie)
                get :director, :id => @movie_id
                expect(response).to redirect_to(movies_path)
            end
        end
    end
   
    describe "#show" do
        it 'should show Movie by id' do
            double = double('fake_movie')
            Movie.should_receive(:find).with('1234').and_return(double)
            get :show, {:id => '1234'}
        end
    end
    
    describe "#index" do
        it 'should redirect if sort order changed' do
            session[:sort] = 'release_date'
            get :index, {:sort => 'title'}
        end
        it 'should be possible to sort by release date' do
            get :index, {:sort => 'release_date'}
        end
        it 'should redirect if selected ratings are changed' do
            get :index, {:ratings => {:PG => 2}}
            response.should redirect_to(movies_path(:ratings => {:PG => 2}))
        end
    end
  
    describe 'delete a movie from movie DB' do
		it 'should display the edit movie template' do
			Movie.stub(:find)
			get :edit, {:id => 5}
			response.should render_template 'edit'
		end
		it 'should call a method to update data' do
			double = double('fake_movie').as_null_object
			Movie.should_receive(:find).and_return(double)
			double.should_receive(:destroy)
			delete :destroy, {:id => 1}
		end
	end
  
    describe 'edit movie info' do
        fixtures :movies
		it 'should update movie' do
		    @test = movies(:fake_movie)
            patch :update, id: @test, movie: { release_date: '2000-05-25' }
            expect(response).to redirect_to movie_path(@test)
		end
	end
	
	describe 'create a movie' do
		it 'should create a new movie successfully' do
            post :create, movie: { title: 'New Movie', rating: 'G', release_date: '2015-11-29', director: 'Me' }
            expect(response).to redirect_to movies_path
		end
	end
end