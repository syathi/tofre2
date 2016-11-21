class BulletinBoardsController < ApplicationController

    def index
        #賞味期限が１週間以内に迫ってるやーつと買ってから1習慣経ってるやーつ
        @public_foods = Refrigerator.where.not(deadline: nil).where(release: 1)
        @public_fresh= Refrigerator.where(deadline: nil).where(release: 1)
        @private_foods = Refrigerator.where.not(deadline: nil).where(release: 1)
        @private_fresh= Refrigerator.where(deadline: nil).where(release: 1)
    end
    
    def show
        
    end
    
end
