Pod::Spec.new do |spec|
  spec.name         = "Textile"
  spec.version      = "0.0.1"
  spec.summary      = "Textile styles your text"
  spec.description  = <<-DESC
  Textile is an iOS framework for easily styling strings to attributed strings.
                   DESC

  spec.homepage     = "https://github.com/aegzorz/textile"
  spec.screenshots  = "https://github.com/aegzorz/textile/blob/main/Textile/Tests/__Snapshots__/ReadmeTests/testLogo.1.png?raw=true"
  spec.license      = "MIT"
  spec.author             = { "Alexander Persson" => "aegzorz@gmail.com" }
  spec.platform     = :ios, "10.0"
  spec.swift_versions = ["5.0"]
  spec.source       = { :git => "https://github.com/aegzorz/textile.git", :tag => "#{spec.version}" }
  spec.source_files  = "Textile/Sources"
end
