module Api

  class DiariesController < ApplicationController

    def index
      diary = Diary.all
      render json: diary, status: :ok
    end

    def show
      diary = Diary.find(params[:id])
      if diary
        render json: diary, status: :ok
      else
        render json: {errors: diary.errors},  status: :unprocessable_entity
      end
    end

    def create
      diary = Diary.new(d_params)
      if diary.save
        render json: diary, status: :created
      else
        render json: {errors: diary.errors}, status: :unprocessable_entity
      end
    end

    def update
      diary = Diary.find(params[:id])
      if diary.update(d_params)
        render json: diary, status: :ok
      else
        render json: {errors: diary.errors}, status: :unprocessable_entity
      end
    end

    def destroy
      diary = Diary.find(params[:id])
      if diary.delete
        render json: diary, status: :ok
      else
        render json: {errors: diary.errors}, status: :unprocessable_entity
      end
    end

    private

    def d_params
      params.require(:diary).permit(:title, :expiration, :kind)
    end
  end
end
