
############ 関数定義ここから ###########

#関数_じゃんけんの手を数字から文字に変換
def func_replace_hand(str)
    case str
        when "0"
            return "グー"
        when "1"
            return "チョキ"
        when "2"
            return "パー"
        when "3"
            return "end"
        else
            return "other"
    end
end

#関数_向きを数字から文字に変換
def func_replace_muki(str)
    case str
        when "0"
            return "上"
        when "1"
            return "下"
        when "2"
            return "左"
        when "3"
            return "右"
        else
            return "other"
    end
end


#関数_じゃんけん (引数:あいこフラグ)
def func_janken(aiko=false)
    
    #あいこモードフラグ確認
    if !aiko
        puts "じゃんけん..."
    else
        puts "あいこで..."
    end
    
    puts "0（グー）／ 1（チョキ）／ 2（パー）／ 3（戦わない）"
    
    jibun = func_replace_hand( gets.chomp.to_s ) #自分の手
    aite = func_replace_hand( rand(3).to_s ) #相手の手
    
    if jibun == "end"
        puts "終了！"
        exit!
        
    elsif jibun == "other"
        puts "0～3のどれかを押してください!"
        func_janken() #再帰
    end
    
    #じゃんけん結果処理
    case [jibun , aite]
        #勝ちパターン
        when ["グー","チョキ"] , ["チョキ","パー"] , ["パー","グー"]
            janken_winner = "jibun"
            
        #負けパターン
        when ["グー","パー"] , ["チョキ","グー"] , ["パー","チョキ"]
            janken_winner = "aite"
            
        #あいこ
        else
            func_janken(true) #あいこモードで再帰
    end
    
    #あいこモードフラグ確認
    if !aiko
        puts "ホイ！"
    else
        puts "ショ！"
    end
    
    puts "----------"
    puts "あなた：#{jibun}を出しました"
    puts "相手：#{aite}を出しました"
    puts "----------"
    
    func_attimuite(janken_winner)#あっち向いてホイへ移行
end


#関数_あっち向いてホイ（引数=じゃんけんの勝者）
def func_attimuite(janken_winner)
    
    puts "あっち向いて～..."
    puts "0（上）／ 1（下）／ 2（左）／ 3（右）"
    
    muki_jibun = func_replace_muki( gets.chomp.to_s ) #自分の方向を入力、文字に置換
    muki_aite = func_replace_muki( rand(4).to_s ) #相手の方向を生成、文字に置換

    if muki_jibun == "other"
        puts "0～3のどれかを押してください"
        func_attimuite(janken_winner) #あっち向いてホイやりなおす
    end

    puts "ホイ！"
    
    #あっち向いてホイの結果表示
    
    if(janken_winner == "jibun") #じゃんけん勝者に応じてメッセージ変更
        #自分が勝者（指さす側なら）
        puts "----------"
        puts "あなた：#{muki_jibun}を指しました"
        puts "相手：#{muki_aite}を向きました"
        puts "----------"
    else
        #自分が敗者（向く側なら）
        puts "----------"
        puts "あなた：#{muki_jibun}を向きました"
        puts "相手：#{muki_aite}を指しました"
        puts "----------"
    end
    
    if muki_jibun == muki_aite
        #向きが一致なら勝敗判定
        if janken_winner == "jibun"
            #じゃんけんで自分が勝っていれば勝利
            puts "★★★★★★★★★★★★"
            puts "あなたの勝ち"
            puts "★★★★★★★★★★★★"
        else
            #じゃんけんで自分が負けていれば負け
            puts "□□□□□□□□□□□□"
            puts "あなたの負け"
            puts "□□□□□□□□□□□□"
        end
        
    else
        #向き不一致の場合
        puts "セーフ！もう一回！"
    end
    
    func_janken() #再戦
    
end

############ 関数定義ここまで ###########

func_janken() #ゲームスタート