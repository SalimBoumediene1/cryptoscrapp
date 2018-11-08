class BitcoinController < ApplicationController

    def show
        @bitcoin = Bitcoin.find(params[:id])
      end
end
