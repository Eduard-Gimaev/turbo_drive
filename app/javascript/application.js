
import "@hotwired/turbo-rails"

import { Turbo } from "@hotwired/turbo-rails"
Turbo.session.drive = true

console.log(Turbo.session.drive)