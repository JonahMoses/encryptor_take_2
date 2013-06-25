class Encryptor

	def cipher(rotation)
		characters = (' '..'z').to_a
		rotated_characters = characters.rotate(rotation)
		Hash[characters.zip(rotated_characters)]
    end

    def encrypt_letter(letter,rotation)
    	cipher_for_rotation = cipher(rotation)
    	cipher_for_rotation[letter]
    end

    def decrypt_letter(letter)
    	lowercase_letter = letter.downcase
    	cipher[lowercase_letter].reverse
    end

    def encrypt(string)
    	letters = string.split("")

    	encrypted_letter = letters.collect do |letter|
  			encrypt_letter(letter)
  		end.join

    end

	def decrypt(string)
		letters = string.split("")

		decrypted_letter = letters.collect do |letter|
			decrypt_letter(letter)
		end.join
	end

end
