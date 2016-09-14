module RnaComplement
  def self.of_dna(dna : String)
    dna.tr("GCTA", "CGAU")
  end
end
