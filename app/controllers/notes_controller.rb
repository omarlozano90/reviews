class NotesController < ApplicationController
	#actions to be executed before anything
	before_action :set_book, only: [:create, :destroy]


	#creates note in terms of book
	def create
		@note = @book.notes.new(note_params)
		if @note.save
			redirect_to @book, notice: "Note succesfully added!"
		else
			redirect_to @book, alert: "Unable ro add note!"
		end
	end

	#destroyes note
	def destroy
		@note = @book.notes.find(params[:id])
		@note.destroy
		redirect_to @book, notice: "Note deleted!"
	end

	private

		#defines book we are working with
		#first function to be executed
		def set_book
			@book = Book.find(params[:book_id])
		end


		#strong parameters
		#for avoiding error or hacks
		def note_params
			params.require(:note).permit(:title, :note)
		end

end
