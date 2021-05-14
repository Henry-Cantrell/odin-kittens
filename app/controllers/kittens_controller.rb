class KittensController < ApplicationController
    def index
        @kittens = Kitten.all
    end

    def show
        @kitten = Kitten.find(params[:id])
    end

    def edit
        @kitten = Kitten.find(params[:id])
    end

    def new
        @kitten = Kitten.new
    end

    def create
        @kitten = Kitten.build(kitten_params)

        if @kitten.save
            flash[:success] = 'Kitten created!'
            redirect_to root_path
        else
            render :new
        end
    end

    def update
        @kitten = Kitten.find(params[:id])

        if @kitten.update_attributes(kitten_params)
            flash[:success] = 'Kitten updated!'
            redirect_to root_path
        else
            render :new
        end
    end

    private

    def kitten_params
        params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end
end
