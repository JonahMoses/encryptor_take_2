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

    def decrypt_letter(letter, rotation)
    	cipher_for_rotation = cipher(rotation-(rotation*2))
    	cipher_for_rotation[letter]
    end

    def encrypt(string, rotation)
    	letters = string.split("")

    	encrypted_letter = letters.collect do |letter|
  			encrypt_letter(letter, rotation)
  		end.join

    end

	def decrypt(string, rotation)
		letters = string.split("")

		decrypted_letter = letters.collect do |letter|
			decrypt_letter(letter, rotation)
		end.join
	end

    def encrypt_file(filename, rotation)
    # 1 Create the file handle to the input file
    encrypt_file = File.open(filename, "r")
    # 2 Read the text of the input file
    encrypt_message = encrypt_file.read
    # 3 Encrypt the text
    decrypted_text = encrypt(encrypt_message, rotation)
    # 4 Create a name for the output file
    decrypted_filename = filename + ".encrypted"
    # 5 Create an output file handle
    decrypted_file = File.open(decrypted_filename, "w")
    # 6 Write out the text
    decrypted_file.write(decrypted_text)
    # 7 Close the file
    decrypted_file.close
    end

    def decrypt_file(filename, rotation)
    # 1 Create the file handle to the encrypted file
    decrypt_file = File.open(filename, "r")
    # 2 Read the encrypted text
    decrypt_message = decrypt_file.read
    # 3 Decrypt the text by passing in the text and rotation
    decrypted_message = decrypt(decrypt_message, rotation)
    # 4 Create a name for the decrypted file
    decrypted_filename = filename.gsub("encrypted", "decrypted")
    # 5 Create an output file handle
    decrypted_file = File.open(decrypted_filename, "w")
    # 6 Write out the text
    decrypted_file.write(decrypted_message)
    # 7 Close the file
    decrypted_file.close
    end

    def supported_characters
        (' '..'z').to_a
    end

    def crack(message)
        supported_characters.count.times.collect do |attempt|
            decrypt(message,attempt)
        end
    end

    def real_time_encryption(string, rotation)
        real_time_message = encrypt(string, rotation)
        puts real_time_message
    end

end
