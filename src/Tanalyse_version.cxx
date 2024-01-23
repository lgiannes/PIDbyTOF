#include "TOADatabase.hxx"

// Source for Tanalyse_version.cxx auto-generated using the
// Tpackage_version.cxx.in template file.

#include "Tanalyse_version.hxx"
#include "analyse_version.h"
#include "analyse_make_date.hxx"

ClassImp(ND::Tanalyse_version);

// Trickiness so that the package version is automatically added to the
// list of used packages.
static ND::Tanalyse_version analyse_version;

ND::Tanalyse_version* ND::Tanalyse_version::fThis = NULL;

ND::Tanalyse_version::Tanalyse_version() {
    fThis = ND::Tanalyse_version::Get();
}

ND::Tanalyse_version::~Tanalyse_version() {}

void ND::Tanalyse_version::Initialize(void) {
    // register this package.
    ND::TOADatabase::Get().PackageSet().insert(fThis);
}

ND::Tanalyse_version* ND::Tanalyse_version::Get(void) {
    // Make sure that fThis is initialized;
    if (!fThis) {
        // Make sure that fThis is not null before allocating a real pointer.
        // This cruft is required so that there isn't an infinite recursion
        // while fThis is initialized.
        fThis = (ND::Tanalyse_version*) 1;
        // Allocate real space for the fThis pointer.
        fThis = new ND::Tanalyse_version;
        // Now initialize
        fThis->Initialize();
    }
    // Return the pointer.
    return fThis;
}

const char* ND::Tanalyse_version::GetName(void) const {
    return analyse_NAME;
}

const char* ND::Tanalyse_version::GetVersion(void) const {
    return analyse_VERSION;
}

const char* ND::Tanalyse_version::GetCompilationDate(void) const {
    return analyse_COMPILE_DATE;
}

const char* ND::Tanalyse_version::GetCompilationHost(void) const {
    return analyse_COMPILE_HOST;
}

const char* ND::Tanalyse_version::GetCompilationDirectory(void) const {
    return analyse_COMPILE_DIR;
}

const char* ND::Tanalyse_version::GetCompilationMachineInfo(void) const {
    return analyse_COMPILE_UNAME;
}
